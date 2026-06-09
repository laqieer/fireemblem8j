	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.section .text.sub_809A2EC, "ax", %progbits
@ sub_809A2EC @ JP 0x0809A2EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A2EC
	.thumb_func
sub_809A2EC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0809A30C @ =0x08A94604
_0809A2F4:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _0809A310
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _0809A310
	adds r0, r5, #0
	b _0809A31A
	.align 2, 0
_0809A30C: .4byte 0x08A94604
_0809A310:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _0809A2F4
	movs r0, #8
_0809A31A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

