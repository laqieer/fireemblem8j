	.syntax unified
	.section .text.GetDirectionOfPathAfterIndex, "ax", %progbits
@ GetDirectionOfPathAfterIndex @ JP 0x08032FE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetDirectionOfPathAfterIndex
	.thumb_func
GetDirectionOfPathAfterIndex:
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r1, _08033008 @ =0x085C6080
	ldr r4, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bne _0803300C
	movs r0, #0
	b _08033054
	.align 2, 0
_08033008: .4byte 0x085C6080
_0803300C:
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r3
	adds r5, r3, #1
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803302A
	movs r0, #1
	b _08033054
_0803302A:
	cmp r2, r1
	ble _08033032
	movs r0, #3
	b _08033054
_08033032:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r3
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803304E
	movs r0, #2
	b _08033054
_0803304E:
	cmp r2, r1
	ble _08033054
	movs r0, #4
_08033054:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

