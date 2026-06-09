	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8077740, "ax", %progbits
@ sub_8077740 @ JP 0x08077740 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077740
	.thumb_func
sub_8077740:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0807776E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_805660C
	b _08077780
_0807776E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08077780
	bl sub_8056130
	adds r0, r4, #0
	bl sub_8002DE4
_08077780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

