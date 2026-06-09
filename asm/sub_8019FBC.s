	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_802E42C, 0x0802E42C + 1
	.set sub_8034548, 0x08034548 + 1
	.section .text.sub_8019FBC, "ax", %progbits
@ sub_8019FBC @ JP 0x08019FBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019FBC
	.thumb_func
sub_8019FBC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0801A04C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8034548
	ldr r6, _0801A050 @ =0x02001000
	adds r1, r6, #0
	bl sub_8013008
	adds r0, r4, #0
	bl sub_802E42C
	adds r4, r0, #0
	ldrb r5, [r4, #2]
	ldrb r0, [r4, #4]
	adds r0, r5, r0
	cmp r5, r0
	bge _0801A042
	ldr r0, _0801A054 @ =0x0202E4D0
	mov r8, r0
	adds r6, #2
	mov ip, r6
	ldr r7, _0801A058 @ =0x085C2E54
_08019FF4:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r5, r0
	ldrb r2, [r4, #1]
	adds r0, r0, r2
	lsls r0, r0, #1
	mov r1, ip
	adds r6, r0, r1
	ldr r1, [r7]
	lsls r0, r5, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r3, r0, r1
	ldrb r0, [r4, #3]
	adds r0, r2, r0
	adds r5, #1
	cmp r2, r0
	bge _0801A034
_0801A01C:
	ldrh r0, [r6]
	strh r0, [r3]
	adds r6, #2
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #3]
	adds r0, r0, r1
	cmp r2, r0
	blt _0801A01C
_0801A034:
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #4]
	adds r0, r0, r1
	cmp r5, r0
	blt _08019FF4
_0801A042:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A04C: .4byte 0x0202BCEC
_0801A050: .4byte 0x02001000
_0801A054: .4byte 0x0202E4D0
_0801A058: .4byte 0x085C2E54

