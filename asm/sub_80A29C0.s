	.syntax unified
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_80A29C0, "ax", %progbits
@ sub_80A29C0 @ JP 0x080A29C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A29C0
	.thumb_func
sub_80A29C0:
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _080A29F0 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_80913FC
	movs r0, #0x7c
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A29F0: .4byte 0x06011000

