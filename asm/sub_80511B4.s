	.syntax unified
	.set EkrClasschgFinished, 0x08074EBC + 1
	.set sub_8074EDC, 0x08074EDC + 1
	.section .text.sub_80511B4, "ax", %progbits
@ sub_80511B4 @ JP 0x080511B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80511B4
	.thumb_func
sub_80511B4:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl EkrClasschgFinished
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080511D0
	bl sub_8074EDC
	ldr r0, _080511D8 @ =0x0203E1C4
	strh r4, [r0]
	ldr r0, _080511DC @ =sub_8051968
	str r0, [r5, #0xc]
_080511D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080511D8: .4byte 0x0203E1C4
_080511DC: .4byte 0x08051969  @ sub_8051968

