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
	.section .text.sub_801F940, "ax", %progbits
@ sub_801F940 @ JP 0x0801F940 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F940
	.thumb_func
sub_801F940:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	add r0, sp, #4
	movs r1, #2
	bl sub_8003D90
	adds r0, r7, #0
	bl sub_801729C
	adds r1, r0, #0
	add r0, sp, #4
	bl sub_8003F28
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
	add r0, sp, #4
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	add r0, sp, #4
	bl sub_8003F28
	add r0, sp, #4
	bl sub_8003D80
	adds r2, r0, #0
	adds r2, #0x28
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F9A2
	adds r0, #0xf
_0801F9A2:
	asrs r5, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F9AC
	adds r0, #7
_0801F9AC:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #8
	movs r3, #4
	bl sub_804F0EC
	lsls r5, r5, #1
	ldr r4, _0801F9F4 @ =0x02022EEA
	adds r6, r5, r4
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r6, #0
	bl DrawIcon
	adds r4, #4
	adds r5, r5, r4
	add r0, sp, #4
	adds r1, r5, #0
	bl PutText
	ldr r0, _0801F9F8 @ =0x085C3540
	mov r1, r8
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9F4: .4byte 0x02022EEA
_0801F9F8: .4byte 0x085C3540

