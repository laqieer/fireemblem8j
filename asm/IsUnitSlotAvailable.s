	.syntax unified
	.section .text.IsUnitSlotAvailable, "ax", %progbits
@ IsUnitSlotAvailable @ JP 0x08018C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsUnitSlotAvailable
	.thumb_func
IsUnitSlotAvailable:
	push {r4, lr}
	adds r1, r0, #1
	adds r0, #0x40
	cmp r1, r0
	bge _08018C8A
	ldr r4, _08018C80 @ =0x085C2A50
	movs r3, #0xff
	adds r2, r0, #0
_08018C6C:
	adds r0, r1, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _08018C84
	movs r0, #1
	b _08018C8C
	.align 2, 0
_08018C80: .4byte 0x085C2A50
_08018C84:
	adds r1, #1
	cmp r1, r2
	blt _08018C6C
_08018C8A:
	movs r0, #0
_08018C8C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

