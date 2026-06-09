	.syntax unified
	.set sub_80139E0, 0x080139E0 + 1
	.section .text.sub_807BE00, "ax", %progbits
@ sub_807BE00 @ JP 0x0807BE00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BE00
	.thumb_func
sub_807BE00:
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	ldr r0, [r0, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0807BE20 @ =0x020228A8
	adds r0, r0, r1
	movs r1, #0x15
	movs r2, #0x14
	bl sub_80139E0
	pop {r0}
	bx r0
	.align 2, 0
_0807BE20: .4byte 0x020228A8

