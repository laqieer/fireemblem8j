	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_8085B30, "ax", %progbits
@ sub_8085B30 @ JP 0x08085B30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085B30
	.thumb_func
sub_8085B30:
	push {lr}
	movs r3, #0
	ldr r2, _08085B64 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08085B5C
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08085B5C
	movs r0, #0x87
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
_08085B5C:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085B64: .4byte 0x0202BCEC

