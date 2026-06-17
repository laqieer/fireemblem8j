	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.OverriddenMenuAvailability, "ax", %progbits
@ OverriddenMenuAvailability @ JP 0x08050520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global OverriddenMenuAvailability
	.thumb_func
OverriddenMenuAvailability:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08050528 @ =0x03001868
	b _0805054A
	.align 2, 0
_08050528: .4byte 0x03001868
_0805052C:
	cmp r3, #1
	bne _08050548
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrb r5, [r4, #9]
	cmp r0, r5
	bne _08050548
	ldr r2, [r2, #4]
	adds r0, r4, #0
	bl sub_80D65C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08050556
_08050548:
	adds r2, #8
_0805054A:
	ldrh r3, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0805052C
	movs r0, #0
_08050556:
	pop {r4, r5}
	pop {r1}
	bx r1

