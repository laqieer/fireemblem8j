	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809F4E0, "ax", %progbits
@ sub_809F4E0 @ JP 0x0809F4E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F4E0
	.thumb_func
sub_809F4E0:
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809F50C @ =0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_0809F4EA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809F510 @ =0x085B8D24
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809F4EA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F50C: .4byte 0x0000DFC0
_0809F510: .4byte 0x085B8D24

