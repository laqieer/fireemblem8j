	.syntax unified
	.set GetCameraCenteredX, 0x08015A5C + 1
	.set GetCameraCenteredY, 0x08015A88 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8012430, 0x08012430 + 1
	.set sub_8018B44, 0x08018B44 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8097A28, 0x08097A28 + 1
	.section .text.sub_8033780, "ax", %progbits
@ sub_8033780 @ JP 0x08033780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033780
	.thumb_func
sub_8033780:
	push {r4, r5, lr}
	bl sub_8018B44
	ldr r4, _080337C8 @ =0x0202BCEC
	ldrb r1, [r4, #0x14]
	movs r5, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080337A2
	bl sub_8097A28
	bl sub_8012430
	ldrb r0, [r4, #0x14]
	orrs r0, r5
	strb r0, [r4, #0x14]
_080337A2:
	movs r0, #0
	bl GetCameraCenteredX
	ldr r4, _080337CC @ =0x0202BCAC
	strh r0, [r4, #0xc]
	movs r0, #0
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r5
	strb r0, [r4, #4]
	bl RefreshEntityBmMaps
	bl sub_8019914
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080337C8: .4byte 0x0202BCEC
_080337CC: .4byte 0x0202BCAC

