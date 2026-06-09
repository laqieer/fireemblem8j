	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809A74C, "ax", %progbits
@ sub_809A74C @ JP 0x0809A74C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A74C
	.thumb_func
sub_809A74C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0809A774
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _0809A77C @ =0x08A9466C
	ldr r0, [r4, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xb0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809A774:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A77C: .4byte 0x08A9466C

