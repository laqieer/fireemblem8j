	.syntax unified
	.set GetCgTextFlags, 0x08090D10 + 1
	.set IsDivinationPortrait1, 0x080A2D10 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80A462C, "ax", %progbits
@ sub_80A462C @ JP 0x080A462C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A462C
	.thumb_func
sub_80A462C:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl IsDivinationPortrait1
	lsls r0, r0, #0x18
	ldr r0, _080A4670 @ =0x000007B1
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _080A4674 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_80913FC
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _080A4678 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4670: .4byte 0x000007B1
_080A4674: .4byte 0x06011000
_080A4678: .4byte 0x0004004E

