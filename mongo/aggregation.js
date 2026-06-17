db.avaliacoes.aggregate([
    {
        $group: {
            _id: "$companhia",
            mediaNota: { $avg: "$nota" },
            quantidadeAvaliacoes: { $sum: 1 }
        }
    },
    {
        $sort: {
            mediaNota: -1
        }
    }
]);