	.syntax unified
	.set GetCgTextFlags, 0x08090D10 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80A447C, "ax", %progbits
@ sub_80A447C @ JP 0x080A447C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A447C
	.thumb_func
sub_80A447C:
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, _080A44C0 @ =0x0202BCEC
	adds r0, #0x2b
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r0, _080A44C4 @ =0x000007B1
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _080A44C8 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_80913FC
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _080A44CC @ =0x0006000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A44C0: .4byte 0x0202BCEC
_080A44C4: .4byte 0x000007B1
_080A44C8: .4byte 0x06011000
_080A44CC: .4byte 0x0006000A

