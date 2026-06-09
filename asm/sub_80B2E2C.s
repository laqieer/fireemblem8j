	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B2E2C, "ax", %progbits
@ sub_80B2E2C @ JP 0x080B2E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2E2C
	.thumb_func
sub_80B2E2C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2E4C @ =0x08A9DD0C
	movs r1, #4
	bl sub_8002BCC
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
_080B2E4C: .4byte 0x08A9DD0C

