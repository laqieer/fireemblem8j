	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B2E74, "ax", %progbits
@ sub_80B2E74 @ JP 0x080B2E74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2E74
	.thumb_func
sub_80B2E74:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2E94 @ =0x08A9DD0C
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E94: .4byte 0x08A9DD0C

