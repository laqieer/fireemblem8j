	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set InitText, 0x08003C8C + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8003D80, 0x08003D80 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_801F804, "ax", %progbits
@ sub_801F804 @ JP 0x0801F804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F804
	.thumb_func
sub_801F804:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	mov sb, r2
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	add r7, sp, #0xc
	adds r0, r7, #0
	movs r1, #0x14
	bl InitText
	add r0, sp, #4
	movs r1, #2
	bl sub_8003D90
	adds r0, r7, #0
	movs r1, #2
	bl sub_8003D90
	mov r0, r8
	bl sub_801729C
	adds r1, r0, #0
	add r0, sp, #4
	bl sub_8003F28
	mov r0, sb
	bl sub_801729C
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_8003F28
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
	adds r0, r7, #0
	movs r1, #2
	bl Text_Skip
	add r0, sp, #4
	movs r1, #0
	bl sub_8003D90
	adds r0, r7, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, _0801F930 @ =0x0000080C
	bl sub_8009FA8
	adds r1, r0, #0
	add r0, sp, #4
	bl sub_8003F28
	ldr r0, _0801F934 @ =0x0000080D
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_8003F28
	add r0, sp, #4
	bl sub_8003D80
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_8003D80
	adds r2, r0, #0
	cmp r4, r2
	ble _0801F8AA
	adds r2, r4, #0
_0801F8AA:
	adds r2, #0x30
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F8B6
	adds r0, #0xf
_0801F8B6:
	asrs r6, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F8C0
	adds r0, #7
_0801F8C0:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #7
	movs r3, #6
	bl sub_804F0EC
	lsls r6, r6, #1
	ldr r5, _0801F938 @ =0x02022EAA
	adds r4, r6, r5
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	mov r8, r0
	adds r0, r4, #0
	mov r2, r8
	bl DrawIcon
	adds r4, r5, #0
	adds r4, #0x80
	adds r4, r6, r4
	mov r0, sb
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, r8
	bl DrawIcon
	adds r1, r5, #4
	adds r1, r6, r1
	add r0, sp, #4
	bl PutText
	adds r5, #0x84
	adds r6, r6, r5
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutText
	ldr r0, _0801F93C @ =0x085C3540
	mov r1, sl
	bl Proc_StartBlocking
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F930: .4byte 0x0000080C
_0801F934: .4byte 0x0000080D
_0801F938: .4byte 0x02022EAA
_0801F93C: .4byte 0x085C3540

