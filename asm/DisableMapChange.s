	.syntax unified
	.set RemoveTrap, 0x0802E234 + 1
	.section .text.DisableMapChange, "ax", %progbits
@ DisableMapChange @ JP 0x0802E544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DisableMapChange
	.thumb_func
DisableMapChange:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802E54C @ =0x0203A610
	b _0802E562
	.align 2, 0
_0802E54C: .4byte 0x0203A610
_0802E550:
	cmp r0, #3
	bne _0802E560
	ldrb r0, [r4, #3]
	cmp r0, r5
	bne _0802E560
	adds r0, r4, #0
	bl RemoveTrap
_0802E560:
	adds r4, #8
_0802E562:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E550
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

