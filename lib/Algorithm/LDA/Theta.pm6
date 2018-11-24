use v6.c;
use NativeCall;
unit class Algorithm::LDA::Theta:ver<0.0.1>:auth<cpan:TITSUKI> is repr('CPointer');

my constant $library = %?RESOURCES<libraries/lda>.Str;

my sub lda_create_theta(int32, int32, int32, num64 --> Algorithm::LDA::Theta) is native($library) { * }
my sub lda_delete_theta(Algorithm::LDA::Theta) is native($library) { * }
my sub lda_theta_allocate(Algorithm::LDA::Theta, int32, int32, int32) is native($library) { * }
my sub lda_theta_deallocate(Algorithm::LDA::Theta, int32, int32, int32) is native($library) { * }
my sub lda_theta_update(Algorithm::LDA::Theta) is native($library) { * }
my sub lda_theta_weight(Algorithm::LDA::Theta, int32, int32, int32 --> num64) is native($library) { * }
my sub lda_theta_num_super_topic(Algorithm::LDA::Theta --> int32) is native($library) { * }
my sub lda_theta_num_sub_topic(Algorithm::LDA::Theta --> int32) is native($library) { * }
my sub lda_theta_num_doc(Algorithm::LDA::Theta --> int32) is native($library) { * }

method new(int :$num-super-topic!, int :$num-sub-topic!, int :$num-doc!, num :$alpha!) {
    lda_create_theta($num-super-topic, $num-sub-topic, $num-doc, $alpha);
}

method num-super-topics(--> int) {
    lda_theta_num_super_topic(self)
}

method num-sub-topics(--> int) {
    lda_theta_num_sub_topic(self)
}

method num-docs(--> int) {
    lda_theta_num_doc(self)
}

method allocate(int $super-topic, int $sub-topic, int $doc-index) {
    lda_theta_allocate(self, $super-topic, $sub-topic, $doc-index);
}

method deallocate(int $super-topic, int $sub-topic, int $doc-index) {
    lda_theta_deallocate(self, $super-topic, $sub-topic, $doc-index);
}

method !update {
    lda_theta_update(self)
}

method weight(int $super-topic, int $sub-topic, int $doc-index --> num) {
    lda_theta_weight(self, $super-topic, $sub-topic, $doc-index);
}
