	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80661EC, "ax", %progbits
@ sub_80661EC @ JP 0x080661EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80661EC
	.thumb_func
sub_80661EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08066208
	ldr r1, _08066204 @ =0x03003020
	ldrh r0, [r1, #0x20]
	adds r0, #2
	b _0806620E
	.align 2, 0
_08066204: .4byte 0x03003020
_08066208:
	ldr r1, _08066230 @ =0x03003020
	ldrh r0, [r1, #0x20]
	subs r0, #2
_0806620E:
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08066228
	adds r0, r4, #0
	bl sub_8002DE4
_08066228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066230: .4byte 0x03003020

