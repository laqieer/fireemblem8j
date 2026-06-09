	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807A548, 0x0807A548 + 1
	.section .text.sub_807A49C, "ax", %progbits
@ sub_807A49C @ JP 0x0807A49C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A49C
	.thumb_func
sub_807A49C:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807A4B6
	ldr r0, [r1, #0x5c]
	bl sub_807A548
	b _0807A4C4
_0807A4B6:
	cmp r0, #0x15
	beq _0807A4C4
	cmp r0, #0x46
	bne _0807A4C4
	adds r0, r1, #0
	bl sub_8002DE4
_0807A4C4:
	pop {r0}
	bx r0

