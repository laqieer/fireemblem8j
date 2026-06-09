	.syntax unified
	.set sub_801490C, 0x0801490C + 1
	.section .text.sub_807BD58, "ax", %progbits
@ sub_807BD58 @ JP 0x0807BD58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BD58
	.thumb_func
sub_807BD58:
	push {lr}
	ldr r2, [r0, #0x30]
	movs r1, #0
	strh r1, [r2, #0x18]
	ldr r2, [r0, #0x30]
	movs r1, #0x40
	strh r1, [r2, #0x1a]
	ldr r2, _0807BD78 @ =sub_807BD7C
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	movs r2, #0x14
	bl sub_801490C
	pop {r0}
	bx r0
	.align 2, 0
_0807BD78: .4byte 0x0807BD7D  @ sub_807BD7C

