	.syntax unified
	.set IsBgmPlaying, 0x080021B4 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.ChangeBgm, "ax", %progbits
@ ChangeBgm @ JP 0x08002938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ChangeBgm
	.thumb_func
ChangeBgm:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	bl IsBgmPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800295E
	ldr r0, _0800296C @ =0x02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _0800295E
	cmp r7, r8
	beq _080029B2
_0800295E:
	cmp r4, #0
	beq _08002974
	ldr r0, _08002970 @ =0x08577648
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0800297C
	.align 2, 0
_0800296C: .4byte 0x02024E5C
_08002970: .4byte 0x08577648
_08002974:
	ldr r0, _0800299C @ =0x08577648
	movs r1, #3
	bl sub_8002BCC
_0800297C:
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl IsBgmPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080029A4
	ldr r0, _080029A0 @ =0x02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _080029A4
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x5c]
	b _080029A6
	.align 2, 0
_0800299C: .4byte 0x08577648
_080029A0: .4byte 0x02024E5C
_080029A4:
	str r5, [r4, #0x5c]
_080029A6:
	adds r0, r4, #0
	adds r0, #0x64
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
_080029B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

