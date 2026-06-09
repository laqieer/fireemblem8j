	.syntax unified
	.set sub_800223C, 0x0800223C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807863C, "ax", %progbits
@ sub_807863C @ JP 0x0807863C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807863C
	.thumb_func
sub_807863C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08078662
	ldr r0, _08078668 @ =0x02020144
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_800223C
	adds r0, r4, #0
	bl sub_8002DE4
_08078662:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078668: .4byte 0x02020144

