	.syntax unified
	.set SetUnitAllItemsUsesToMax, 0x0804E1A0 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8043138, 0x08043138 + 1
	.section .text.sub_80463F4, "ax", %progbits
@ sub_80463F4 @ JP 0x080463F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80463F4
	.thumb_func
sub_80463F4:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r0, _0804641C @ =0x0203DA20
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08046420
	adds r0, r5, #0
	bl sub_8043138
	b _08046426
	.align 2, 0
_0804641C: .4byte 0x0203DA20
_08046420:
	adds r0, r5, #0
	bl SetUnitAllItemsUsesToMax
_08046426:
	pop {r4, r5}
	pop {r0}
	bx r0

