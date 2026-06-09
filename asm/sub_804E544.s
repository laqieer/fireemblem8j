	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_804E4B8, 0x0804E4B8 + 1
	.section .text.sub_804E544, "ax", %progbits
@ sub_804E544 @ JP 0x0804E544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E544
	.thumb_func
sub_804E544:
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _0804E566
	ldr r1, [r1, #0x2c]
	ldr r3, _0804E56C @ =0x080DF26A
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804E4B8
_0804E566:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804E56C: .4byte 0x080DF26A

