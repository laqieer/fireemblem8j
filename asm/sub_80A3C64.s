	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_80913FC, 0x080913FC + 1
	.set sub_80A40D4, 0x080A40D4 + 1
	.set sub_80A412C, 0x080A412C + 1
	.section .text.sub_80A3C64, "ax", %progbits
@ sub_80A3C64 @ JP 0x080A3C64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3C64
	.thumb_func
sub_80A3C64:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_80A412C
	adds r7, r0, #0
	cmp r7, #0
	bne _080A3C82
	strh r7, [r6]
	movs r0, #0
	bl sub_80A412C
	adds r7, r0, #0
_080A3C82:
	ldrh r0, [r6]
	bl sub_80A40D4
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _080A3CE0 @ =0x088582BC
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_800783C
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl sub_8006710
	str r5, [sp]
	ldr r0, _080A3CE4 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	ldr r0, _080A3CE8 @ =0x0002000A
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3CE0: .4byte 0x088582BC
_080A3CE4: .4byte 0x06011000
_080A3CE8: .4byte 0x0002000A

