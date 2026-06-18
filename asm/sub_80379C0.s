	.syntax unified
	.set AddDamagingTrap, 0x0802E218 + 1
	.section .text.sub_80379C0, "ax", %progbits
@ AddGorgonEggTrap @ JP 0x080379C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AddGorgonEggTrap
	.thumb_func
AddGorgonEggTrap:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r2, #0
	ldr r4, [sp, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xc
	adds r3, r5, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

