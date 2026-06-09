	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805CF24, "ax", %progbits
@ sub_805CF24 @ JP 0x0805CF24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CF24
	.thumb_func
sub_805CF24:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0805CF56
	ldr r1, _0805CF5C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0805CF60 @ =0x02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0805CF56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CF5C: .4byte 0x0201774C
_0805CF60: .4byte 0x02017758

