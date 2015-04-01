$(document).ready(function () {
    $('.question_change_type').change(function () {
        var question_type = $(this).find('option:selected').attr('value');
        switch (question_type) {
            case '':
                hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'field_length_label', 'field_length_field', 'verification'], false)
                break
            case 'TextQuestion':
                hide_and_disable(['max_char', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_val', 'min_val', 'allow_others'], false)
                break
            case 'TextBlockQuestion':
                hide_and_disable(['max_char', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_val', 'min_val', 'allow_others'], false)
                break
            case 'NumberQuestion':
                hide_and_disable(['max_val', 'min_val', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_char', 'allow_others'], false)
                break
            case 'DateQuestion':
                hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
                break
            case 'YearQuestion':
                hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
                break
            case 'SingleAnswerQuestion':
                hide_and_disable(['allow_others'], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'field_length_label', 'field_length_field'], true)
                break
            case 'MultipleAnswerQuestion':
                hide_and_disable(['allow_others'], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'field_length_label', 'field_length_field'], true)
                break
            case 'BooleanQuestion':
                hide_and_disable(['negative_val', 'positive_val'], ['max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
                break
        }
    });

    default_select();
    verfication_default();
    $('.back_questions').click(function () {
        location.href = document.referrer;
    });
});

function default_select() {
    var question_type = $('.question_change_type option:selected').attr('value');
    switch (question_type) {
        case '':
            hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'field_length_label', 'field_length_field', 'max_val', 'min_val', 'allow_others'], false)
            break
        case 'TextQuestion':
            hide_and_disable(['max_char', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_val', 'min_val', 'allow_others'], false)
            break
        case 'TextBlockQuestion':
            hide_and_disable(['max_char', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_val', 'min_val', 'allow_others'], false)
            break
        case 'NumberQuestion':
            hide_and_disable(['max_val', 'min_val', 'field_length_label', 'field_length_field'], ['negative_val', 'positive_val', 'max_char', 'allow_others'], false)
            break
        case 'DateQuestion':
            hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
            break
        case 'YearQuestion':
            hide_and_disable([], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
            break
        case 'SingleAnswerQuestion':
            hide_and_disable(['allow_others'], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'field_length_label', 'field_length_field'], true)
            break
        case 'MultipleAnswerQuestion':
            hide_and_disable(['allow_others'], ['negative_val', 'positive_val', 'max_char', 'max_val', 'min_val', 'field_length_label', 'field_length_field'], true)
            break
        case 'BooleanQuestion':
            hide_and_disable(['negative_val', 'positive_val'], ['max_char', 'max_val', 'min_val', 'allow_others', 'field_length_label', 'field_length_field'], false)
            break
    }
}

function hide_and_disable(show_elements, hide_elements, display_options) {
    for (i = 0; i < show_elements.length; i++) {
        $('#' + show_elements[i] + ' input').attr('enabled', 'enabled').removeAttr("disabled");
        $('#' + show_elements[i]).show();
    }
    for (i = 0; i < hide_elements.length; i++) {
        $('#' + hide_elements[i] + ' input').attr("disabled", "disabled");
        $('#' + hide_elements[i]).hide();
    }
    if (display_options) {
        $('#add_option').show()
        $('.option').css('display', 'block');
    }
    else {
        $('#add_option').hide()
        $('.option').css('display', 'none');
    }
}

function verification_method_name(verification) {
    value = verification.value
    if (value != '') {
        $('#verification').show();
    }
    else {
        $('#verification').hide();
    }
}

function verfication_default() {
    var verfication_type = $('#question_verification_method_id option:selected').attr('value');
    if (verfication_type = '') {
        $('#verification').show();
    }
    else {
        $('#verification').hide();
    }
}


$(document).on('click', '.add_new_option', function () {
    var add_option = "<li class='option'> <nobr> Option: <input type='text' size='30' name='questions[options_attributes][][name]' id='question_new_options__name' class='input_text'>Correct Option:<input id='question_new_options__default_value' class='' type='checkbox' value='1' name='questions[options_attributes][][default_value]'> <a href='javascript:void(0);' class='close_button_option' data-removeparentelement='li'><img height='15' src='/images/cancel.png' alt='Remove'></a></nobr></li>";
    $('#option_list #add_option_txt_field').append(add_option);
});
$(document).on('click', '.close_button_option', function () {
    var remove_parent_element = $(this).attr('data-removeparentelement');
    $(this).parents(remove_parent_element).remove();
});
