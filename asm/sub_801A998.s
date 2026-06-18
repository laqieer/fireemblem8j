	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnitWeaponReachBits, 0x08016F90 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_801A998, "ax", %progbits
@ GenerateUnitCompleteAttackRange @ JP 0x0801A998 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateUnitCompleteAttackRange
	.thumb_func
GenerateUnitCompleteAttackRange:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	bl GetUnitWeaponReachBits
	subs r0, #1
	cmp r0, #0xe
	bls _0801A9B6
	b _0801B054
_0801A9B6:
	lsls r0, r0, #2
	ldr r1, _0801A9C0 @ =_0801A9C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A9C0: .4byte _0801A9C4
_0801A9C4: @ jump table
	.4byte _0801AA00 @ case 0
	.4byte _0801ABB0 @ case 1
	.4byte _0801AA90 @ case 2
	.4byte _0801ACD0 @ case 3
	.4byte _0801ADF0 @ case 4
	.4byte _0801AC40 @ case 5
	.4byte _0801AB20 @ case 6
	.4byte _0801B054 @ case 7
	.4byte _0801AFD8 @ case 8
	.4byte _0801B054 @ case 9
	.4byte _0801B054 @ case 10
	.4byte _0801AD60 @ case 11
	.4byte _0801AE9C @ case 12
	.4byte _0801B054 @ case 13
	.4byte _0801AF48 @ case 14
_0801AA00:
	ldr r0, _0801AA80 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AA0E
	b _0801B054
_0801AA0E:
	ldr r0, _0801AA80 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AA78
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AA24:
	ldr r0, _0801AA84 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AA72
	ldr r0, _0801AA88 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA72
	ldr r0, _0801AA8C @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA72
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AA72:
	subs r7, #1
	cmp r7, #0
	bge _0801AA24
_0801AA78:
	mov r6, sl
	cmp r6, #0
	bge _0801AA0E
	b _0801B054
	.align 2, 0
_0801AA80: .4byte 0x0202E4D0
_0801AA84: .4byte 0x0202E4DC
_0801AA88: .4byte 0x0202E4D4
_0801AA8C: .4byte 0x0202E4EC
_0801AA90:
	ldr r0, _0801AB10 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AA9E
	b _0801B054
_0801AA9E:
	ldr r0, _0801AB10 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AB08
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AAB4:
	ldr r0, _0801AB14 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AB02
	ldr r0, _0801AB18 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB02
	ldr r0, _0801AB1C @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB02
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AB02:
	subs r7, #1
	cmp r7, #0
	bge _0801AAB4
_0801AB08:
	mov r6, sl
	cmp r6, #0
	bge _0801AA9E
	b _0801B054
	.align 2, 0
_0801AB10: .4byte 0x0202E4D0
_0801AB14: .4byte 0x0202E4DC
_0801AB18: .4byte 0x0202E4D4
_0801AB1C: .4byte 0x0202E4EC
_0801AB20:
	ldr r0, _0801ABA0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AB2E
	b _0801B054
_0801AB2E:
	ldr r0, _0801ABA0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AB98
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AB44:
	ldr r0, _0801ABA4 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AB92
	ldr r0, _0801ABA8 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB92
	ldr r0, _0801ABAC @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB92
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AB92:
	subs r7, #1
	cmp r7, #0
	bge _0801AB44
_0801AB98:
	mov r6, sl
	cmp r6, #0
	bge _0801AB2E
	b _0801B054
	.align 2, 0
_0801ABA0: .4byte 0x0202E4D0
_0801ABA4: .4byte 0x0202E4DC
_0801ABA8: .4byte 0x0202E4D4
_0801ABAC: .4byte 0x0202E4EC
_0801ABB0:
	ldr r0, _0801AC30 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ABBE
	b _0801B054
_0801ABBE:
	ldr r0, _0801AC30 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AC28
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ABD4:
	ldr r0, _0801AC34 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AC22
	ldr r0, _0801AC38 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	ldr r0, _0801AC3C @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AC22:
	subs r7, #1
	cmp r7, #0
	bge _0801ABD4
_0801AC28:
	mov r6, sl
	cmp r6, #0
	bge _0801ABBE
	b _0801B054
	.align 2, 0
_0801AC30: .4byte 0x0202E4D0
_0801AC34: .4byte 0x0202E4DC
_0801AC38: .4byte 0x0202E4D4
_0801AC3C: .4byte 0x0202E4EC
_0801AC40:
	ldr r0, _0801ACC0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AC4E
	b _0801B054
_0801AC4E:
	ldr r0, _0801ACC0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801ACB8
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AC64:
	ldr r0, _0801ACC4 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801ACB2
	ldr r0, _0801ACC8 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ACB2
	ldr r0, _0801ACCC @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ACB2
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801ACB2:
	subs r7, #1
	cmp r7, #0
	bge _0801AC64
_0801ACB8:
	mov r6, sl
	cmp r6, #0
	bge _0801AC4E
	b _0801B054
	.align 2, 0
_0801ACC0: .4byte 0x0202E4D0
_0801ACC4: .4byte 0x0202E4DC
_0801ACC8: .4byte 0x0202E4D4
_0801ACCC: .4byte 0x0202E4EC
_0801ACD0:
	ldr r0, _0801AD50 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ACDE
	b _0801B054
_0801ACDE:
	ldr r0, _0801AD50 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AD48
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ACF4:
	ldr r0, _0801AD54 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AD42
	ldr r0, _0801AD58 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD42
	ldr r0, _0801AD5C @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD42
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AD42:
	subs r7, #1
	cmp r7, #0
	bge _0801ACF4
_0801AD48:
	mov r6, sl
	cmp r6, #0
	bge _0801ACDE
	b _0801B054
	.align 2, 0
_0801AD50: .4byte 0x0202E4D0
_0801AD54: .4byte 0x0202E4DC
_0801AD58: .4byte 0x0202E4D4
_0801AD5C: .4byte 0x0202E4EC
_0801AD60:
	ldr r0, _0801ADE0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AD6E
	b _0801B054
_0801AD6E:
	ldr r0, _0801ADE0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801ADD8
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AD84:
	ldr r0, _0801ADE4 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801ADD2
	ldr r0, _0801ADE8 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ADD2
	ldr r0, _0801ADEC @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ADD2
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801ADD2:
	subs r7, #1
	cmp r7, #0
	bge _0801AD84
_0801ADD8:
	mov r6, sl
	cmp r6, #0
	bge _0801AD6E
	b _0801B054
	.align 2, 0
_0801ADE0: .4byte 0x0202E4D0
_0801ADE4: .4byte 0x0202E4DC
_0801ADE8: .4byte 0x0202E4D4
_0801ADEC: .4byte 0x0202E4EC
_0801ADF0:
	ldr r0, _0801AE8C @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ADFE
	b _0801B054
_0801ADFE:
	ldr r0, _0801AE8C @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AE84
	lsls r1, r6, #2
	mov r8, r1
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AE16:
	ldr r0, _0801AE90 @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AE7E
	ldr r0, _0801AE94 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE7E
	ldr r0, _0801AE98 @ =0x0202E4EC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE7E
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AE7E:
	subs r7, #1
	cmp r7, #0
	bge _0801AE16
_0801AE84:
	mov r6, sl
	cmp r6, #0
	bge _0801ADFE
	b _0801B054
	.align 2, 0
_0801AE8C: .4byte 0x0202E4D0
_0801AE90: .4byte 0x0202E4DC
_0801AE94: .4byte 0x0202E4D4
_0801AE98: .4byte 0x0202E4EC
_0801AE9C:
	ldr r0, _0801AF38 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AEAA
	b _0801B054
_0801AEAA:
	ldr r0, _0801AF38 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801AF30
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AEC2:
	ldr r0, _0801AF3C @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF2A
	ldr r0, _0801AF40 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF2A
	ldr r0, _0801AF44 @ =0x0202E4EC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF2A
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AF2A:
	subs r7, #1
	cmp r7, #0
	bge _0801AEC2
_0801AF30:
	mov r6, sl
	cmp r6, #0
	bge _0801AEAA
	b _0801B054
	.align 2, 0
_0801AF38: .4byte 0x0202E4D0
_0801AF3C: .4byte 0x0202E4DC
_0801AF40: .4byte 0x0202E4D4
_0801AF44: .4byte 0x0202E4EC
_0801AF48:
	ldr r0, _0801AFC8 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AF56
	b _0801B054
_0801AF56:
	ldr r0, _0801AFC8 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AFC0
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AF6C:
	ldr r0, _0801AFCC @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AFBA
	ldr r0, _0801AFD0 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFBA
	ldr r0, _0801AFD4 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFBA
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AFBA:
	subs r7, #1
	cmp r7, #0
	bge _0801AF6C
_0801AFC0:
	mov r6, sl
	cmp r6, #0
	bge _0801AF56
	b _0801B054
	.align 2, 0
_0801AFC8: .4byte 0x0202E4D0
_0801AFCC: .4byte 0x0202E4DC
_0801AFD0: .4byte 0x0202E4D4
_0801AFD4: .4byte 0x0202E4EC
_0801AFD8:
	ldr r0, _0801B128 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B054
_0801AFE4:
	ldr r0, _0801B128 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B04E
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AFFA:
	ldr r0, _0801B12C @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B048
	ldr r0, _0801B130 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B048
	ldr r0, _0801B134 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B048
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B048:
	subs r7, #1
	cmp r7, #0
	bge _0801AFFA
_0801B04E:
	mov r6, sl
	cmp r6, #0
	bge _0801AFE4
_0801B054:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801B110
	ldr r0, _0801B128 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B110
_0801B074:
	ldr r0, _0801B128 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801B10A
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
_0801B08E:
	ldr r0, _0801B12C @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B104
	ldr r0, _0801B130 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B104
	ldr r0, _0801B134 @ =0x0202E4EC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B104
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8037A24
	adds r1, r0, #0
	cmp r1, #0
	beq _0801B104
	lsls r5, r7, #0x10
	asrs r5, r5, #0x10
	str r1, [sp]
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, [sp]
	adds r0, r1, #0
	bl GetItemMaxRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, sb
	movs r3, #1
	bl MapAddInRange
	subs r4, #1
	adds r0, r5, #0
	mov r1, sb
	adds r2, r4, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B104:
	subs r7, #1
	cmp r7, #0
	bge _0801B08E
_0801B10A:
	mov r6, sl
	cmp r6, #0
	bge _0801B074
_0801B110:
	ldr r2, _0801B12C @ =0x0202E4DC
	ldr r1, [r2]
	ldr r0, _0801B138 @ =0x03004940
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B128: .4byte 0x0202E4D0
_0801B12C: .4byte 0x0202E4DC
_0801B130: .4byte 0x0202E4D4
_0801B134: .4byte 0x0202E4EC
_0801B138: .4byte 0x03004940

