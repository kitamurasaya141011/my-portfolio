document.addEventListener('turbo:load', function() {
  const roleSelect = document.getElementById('role-select');
  
  // 固有情報フィールドのDOM要素を取得
  const studentFields = document.getElementById('student-fields');
  const teacherFields = document.getElementById('teacher-fields');
  // ... 他のフィールドも同様に取得

  // 役割名とフィールドIDのマッピング（サーバーサイドのデータが必要）
  // サーバーサイドから role_id と name の対応を渡す
  // 例として、ロール名で判断する簡単な関数を定義
  // 実際には、コントローラーから data 属性などで ID を渡すのが理想的
  
  // 仮の対応表 (seeds.rb の '学生' や '教員' のIDを想定)
  const ROLE_MAP = {
    '学生': studentFields,
    '教員': teacherFields
    // '事務局': adminFields // 管理者は画面から作らないため不要
  };

  function setRequired(fieldGroup, isRequired) {
    if (!fieldGroup) return;

    // input, select, textarea要素をすべて取得
    const inputs = fieldGroup.querySelectorAll('input, select, textarea');
    
    inputs.forEach(input => {
      // フォームコントロールにのみ 'required' を設定/解除
      // type="hidden" の要素は除外（通常はhidden_fieldにはrequiredは不要なため）
      if (input.type !== 'hidden'&& input.type !== 'checkbox') {
        input.required = isRequired;
      }
    });
  }

  function toggleFields() {
    const selectedRoleName = roleSelect.options[roleSelect.selectedIndex].text;

    // 1. まずすべての固有フィールドを非表示にし、required属性を解除する
    Object.values(ROLE_MAP).forEach(field => {
      if (field) {
        field.style.display = 'none';
        setRequired(field, false); // 必須属性を削除
      }
    });

    const targetField = ROLE_MAP[selectedRoleName];

    // 2. 選択された役割に対応するフィールドを表示し、required属性を設定する
    if (targetField) {
      targetField.style.display = 'block';
      setRequired(targetField, true); // 必須属性を設定
    }
  }

  // ページロード時とドロップダウン変更時に実行
  if (roleSelect) {
    roleSelect.addEventListener('change', toggleFields);
    // 初期状態を適用
    toggleFields();
  }
});
