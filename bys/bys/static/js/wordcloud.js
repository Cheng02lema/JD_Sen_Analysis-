// 获取批量生成的词云数据
async function fetchBatchWordCloudData() {
    const response = await fetch('http://localhost:8001/wordcloud'); // 请根据你的后端API地址进行调整
    if (!response.ok) {
        throw new Error('Network response was not ok ' + response.statusText);
    }
    const data = await response.json();
    return data.word_cloud;
}

// 生成词云
function generateWordCloud(words, containerId) {
    const chartDom = document.getElementById(containerId);
    const myChart = echarts.init(chartDom);
    const option = {
        tooltip: {},
        series: [{
            type: 'wordCloud',
            gridSize: 2,
            sizeRange: [12, 50],
            rotationRange: [-90, 90],
            shape: 'circle',
            width: 600,
            height: 400,
            drawOutOfBound: false,
            data: words
        }]
    };

    myChart.setOption(option);
}

// 生成柱状图
function generateBarChart(data, containerId) {
    const chartDom = document.getElementById(containerId);
    const myChart = echarts.init(chartDom);
    const option = {
        title: {
            text: '关键词柱状图'
        },
        tooltip: {},
        xAxis: {
            data: data.categories
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            data: data.data
        }]
    };

    myChart.setOption(option);
}

// 生成饼图
function generatePieChart(data, containerId) {
    const chartDom = document.getElementById(containerId);
    const myChart = echarts.init(chartDom);
    const option = {
        title: {
            text: '关键词饼图',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        series: [{
            name: '关键词',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: data.data,
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };

    myChart.setOption(option);
}

async function main() {
    try {
        const words = await fetchBatchWordCloudData();
        generateWordCloud(words, 'batchWordCloud');
    } catch (error) {
        console.error('Failed to fetch word cloud data:', error);
    }
}

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('brandForm').onsubmit = function (event) {
        event.preventDefault();
        const brand = document.getElementById('brand_select').value;
        fetch(`/wordcloud?brand=${brand}`)
            .then(response => response.json())
            .then(data => {
                // 生成原始词云图
                generateWordCloud(data.words, 'originalWordCloud');

                // 生成柱状图
                generateBarChart(data.barChart, 'barChart');

                // 生成饼图
                generatePieChart(data.pieChart, 'pieChart');
            })
            .catch(error => console.error('Error:', error));

        // 生成新的词云图
        main();
    };

    // 生成默认的批量词云图
    main();
});
