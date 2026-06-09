	.syntax unified
	.section .text.GetFaceIdByXPos, "ax", %progbits
@ GetFaceIdByXPos @ JP 0x0800785C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetFaceIdByXPos
	.thumb_func
GetFaceIdByXPos:
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08007878 @ =0x03004920
_08007864:
	ldr r0, [r2]
	cmp r0, #0
	beq _0800787C
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _0800787C
	adds r0, r1, #0
	b _08007888
	.align 2, 0
_08007878: .4byte 0x03004920
_0800787C:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08007864
	movs r0, #1
	rsbs r0, r0, #0
_08007888:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

