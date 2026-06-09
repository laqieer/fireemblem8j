	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_806F1A4, 0x0806F1A4 + 1
	.set sub_806F2A4, 0x0806F2A4 + 1
	.section .text.sub_806F154, "ax", %progbits
@ sub_806F154 @ JP 0x0806F154 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F154
	.thumb_func
sub_806F154:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F180 @ =0x0201774C
	ldr r5, [r0]
	cmp r5, #0
	bne _0806F192
	ldr r0, _0806F184 @ =0x0860355C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, _0806F188 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806F18C
	adds r0, r4, #0
	bl sub_806F1A4
	b _0806F192
	.align 2, 0
_0806F180: .4byte 0x0201774C
_0806F184: .4byte 0x0860355C
_0806F188: .4byte 0x0203E11C
_0806F18C:
	adds r0, r4, #0
	bl sub_806F2A4
_0806F192:
	pop {r4, r5}
	pop {r0}
	bx r0

