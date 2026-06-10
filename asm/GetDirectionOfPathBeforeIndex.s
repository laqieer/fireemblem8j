	.syntax unified
	.section .text.GetDirectionOfPathBeforeIndex, "ax", %progbits
@ GetDirectionOfPathBeforeIndex @ JP 0x08032F80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetDirectionOfPathBeforeIndex
	.thumb_func
GetDirectionOfPathBeforeIndex:
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _08032F90
	movs r0, #0
	b _08032FE2
_08032F90:
	ldr r1, _08032FB4 @ =0x085C6080
	ldr r4, [r1]
	subs r5, r3, #1
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _08032FB8
	movs r0, #3
	b _08032FE2
	.align 2, 0
_08032FB4: .4byte 0x085C6080
_08032FB8:
	cmp r2, r1
	ble _08032FC0
	movs r0, #1
	b _08032FE2
_08032FC0:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _08032FDC
	movs r0, #4
	b _08032FE2
_08032FDC:
	cmp r2, r1
	ble _08032FE2
	movs r0, #2
_08032FE2:
	pop {r4, r5}
	pop {r1}
	bx r1

