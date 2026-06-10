	.syntax unified
	.set sub_801B6B0, 0x0801B6B0 + 1
	.section .text.sub_80329D8, "ax", %progbits
@ sub_80329D8 @ JP 0x080329D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80329D8
	.thumb_func
sub_80329D8:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r5, _08032A4C @ =0x085C6080
	ldr r3, [r5]
	adds r3, #0x2c
	ldrb r2, [r3]
	adds r2, #1
	strb r2, [r3]
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, #0x2d
	adds r2, r2, r3
	asrs r6, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r2]
	ldr r0, [r5]
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, #0x41
	adds r0, r0, r2
	asrs r4, r1, #0x18
	lsrs r1, r1, #0x18
	strb r1, [r0]
	bl sub_801B6B0
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	ldr r1, _08032A50 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r1, [r4]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032A4C: .4byte 0x085C6080
_08032A50: .4byte 0x0202E4D8

