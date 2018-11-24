use v6.c;
use NativeCall;
unit class Algorithm::LDA::Phi:ver<0.0.1>:auth<cpan:TITSUKI> is repr('CPointer');

my constant $library = %?RESOURCES<libraries/lda>.Str;

my sub lda_create_phi(int32, int32, num64 --> Algorithm::LDA::Phi) is native($library) { * }
my sub lda_phi_allocate(Algorithm::LDA::Phi, int32, int32) is native($library) { * }
my sub lda_phi_deallocate(Algorithm::LDA::Phi, int32, int32) is native($library) { * }
my sub lda_phi_weight(Algorithm::LDA::Phi, int32, int32 --> num64) is native($library) { * }
my sub lda_phi_num_sub_topic(Algorithm::LDA::Phi --> int32) is native($library) { * }
my sub lda_phi_num_word_type(Algorithm::LDA::Phi --> int32) is native($library) { * }

method new(int :$num-sub-topic!, int :$num-word-type!, num :$beta!) {
    lda_create_phi($num-sub-topic, $num-word-type, $beta);
}

method allocate(int $sub-topic, int $word-type) {
    lda_phi_allocate(self, $sub-topic, $word-type);
}

method deallocate(int $sub-topic, int $word-type) {
    lda_phi_deallocate(self, $sub-topic, $word-type);
}

method num-topics {
    lda_phi_num_sub_topic(self);
}

method num-word-types {
    lda_phi_num_word_type(self);
}

method weight(int $sub-topic, int $word-type --> num) {
    lda_phi_weight(self, $sub-topic, $word-type);
}
