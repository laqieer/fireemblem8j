	.syntax unified
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80A32C0, "ax", %progbits
@ sub_80A32C0 @ JP 0x080A32C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A32C0
	.thumb_func
sub_80A32C0:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl sub_8006710
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _080A32FC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A32FC: .4byte 0x06011000

