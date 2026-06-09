	.syntax unified
	.set EkrModifyBarfx, 0x08073644 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80516DC, "ax", %progbits
@ sub_80516DC @ JP 0x080516DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80516DC
	.thumb_func
sub_80516DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _080517A4 @ =0x02019490
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	movs r1, #0x64
	bl sub_80D637C
	adds r5, r0, #0
	movs r1, #0xa
	bl sub_80D6374
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r5, r0
	cmp r4, #0
	bne _08051718
	movs r4, #0xa
_08051718:
	mov r0, r8
	adds r1, r5, #0
	bl EkrModifyBarfx
	lsls r4, r4, #5
	mov sb, r4
	lsls r6, r6, #5
	str r6, [sp]
	mov r6, sl
	mov r5, r8
	ldr r0, _080517A8 @ =0x0885761C
	mov r8, r0
	movs r4, #0xc
_08051732:
	ldrh r0, [r5]
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #8
	bl sub_80D636C
	adds r6, #0x20
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08051732
	ldr r4, _080517AC @ =0x0885791C
	mov r1, sb
	adds r0, r1, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl sub_80D636C
	ldr r2, [sp]
	adds r4, r2, r4
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r1, _080517B0 @ =0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08051794
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r0, _080517B4 @ =sub_80517B8
	str r0, [r7, #0xc]
_08051794:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080517A4: .4byte 0x02019490
_080517A8: .4byte 0x0885761C
_080517AC: .4byte 0x0885791C
_080517B0: .4byte 0x060021A0
_080517B4: .4byte 0x080517B9  @ sub_80517B8

