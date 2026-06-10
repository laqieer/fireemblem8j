	.syntax unified
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_801FAA0, "ax", %progbits
@ sub_801FAA0 @ JP 0x0801FAA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FAA0
	.thumb_func
sub_801FAA0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0801FAFC @ =0x02023CA8
	adds r0, r4, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0801FB00 @ =0x08A7AE50
	ldr r5, _0801FB04 @ =0x02001F72
	adds r1, r5, #0
	bl sub_8013008
	movs r1, #0
	mov ip, r4
	mov r8, r5
	ldr r0, _0801FB08 @ =0x00005001
	adds r5, r0, #0
_0801FAC6:
	movs r3, #0
	adds r4, r1, #1
	lsls r1, r4, #5
	adds r1, #3
	lsls r0, r6, #1
	mov r7, r8
	adds r2, r0, r7
	lsls r1, r1, #1
	add r1, ip
_0801FAD8:
	ldrh r7, [r2]
	adds r0, r5, r7
	strh r0, [r1]
	adds r2, #2
	adds r6, #1
	adds r1, #2
	adds r3, #1
	cmp r3, #0x17
	ble _0801FAD8
	adds r1, r4, #0
	cmp r1, #0x11
	ble _0801FAC6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FAFC: .4byte 0x02023CA8
_0801FB00: .4byte 0x08A7AE50
_0801FB04: .4byte 0x02001F72
_0801FB08: .4byte 0x00005001

