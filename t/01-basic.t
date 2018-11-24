use v6.c;
use NativeCall;
use Test;
use Algorithm::LDA;
use Algorithm::LDA::LDAModel;
use Algorithm::LDA::Document;
use Algorithm::LDA::Formatter;

subtest {
    my @documents = (
        "a b c",
        "d e f",
    );
    my ($documents, $vocabs) = Algorithm::LDA::Formatter.from-plain(@documents);
    my Algorithm::LDA $lda .= new(:$documents, :$vocabs);
    my Algorithm::LDA::LDAModel $model = $lda.fit(:num-topics(3), :num-iterations(1000));
    lives-ok { $model.topic-word-matrix }
    lives-ok { $model.document-topic-matrix }
    lives-ok { $model.log-likelihood }
    lives-ok { $model.nbest-words-per-topic }
}, "Check if it could process a very short document.";


done-testing;
