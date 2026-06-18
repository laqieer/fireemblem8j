	.syntax unified
	.section .text.sub_8032BB0, "ax", %progbits
@ GetMovementScriptFromPath @ JP 0x08032BB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetMovementScriptFromPath
	.thumb_func
GetMovementScriptFromPath:
	push {r4, r5, r6, r7, lr}
	movs r4, #1
	ldr r1, _08032BF0 @ =0x085C6080
	ldr r0, [r1]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r1, #0
	ldr r2, _08032BF4 @ =0x02033EF8
	mov ip, r2
	cmp r4, r0
	bgt _08032C3C
	movs r6, #0x80
	lsls r6, r6, #0x12
	mov r5, ip
_08032BD0:
	ldr r3, [r1]
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r4
	subs r2, r4, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08032BF8
	movs r0, #0
	b _08032C1E
	.align 2, 0
_08032BF0: .4byte 0x085C6080
_08032BF4: .4byte 0x02033EF8
_08032BF8:
	cmp r1, r0
	ble _08032C00
	movs r0, #1
	b _08032C1E
_08032C00:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08032C1C
	movs r0, #3
	b _08032C1E
_08032C1C:
	movs r0, #2
_08032C1E:
	strb r0, [r5]
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r6, r6, r1
	adds r5, #1
	asrs r4, r0, #0x18
	adds r1, r7, #0
	ldr r0, [r1]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble _08032BD0
_08032C3C:
	subs r0, r4, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

