	.syntax unified
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8004564, 0x08004564 + 1
	.section .text.sub_8008058, "ax", %progbits
@ sub_8008058 @ JP 0x08008058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008058
	.thumb_func
sub_8008058:
	push {r4, r5, lr}
	ldr r0, _0800808C @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_08008064:
	lsls r4, r5, #3
	ldr r0, _08008090 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004564
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	movs r1, #4
	bl sub_8003D84
	adds r5, #1
	cmp r5, #1
	ble _08008064
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800808C: .4byte 0x085B90D4
_08008090: .4byte 0x030000C8

