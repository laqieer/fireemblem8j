	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805CE1C, "ax", %progbits
@ sub_805CE1C @ JP 0x0805CE1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CE1C
	.thumb_func
sub_805CE1C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0805CE72
	ldr r1, _0805CE60 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, _0805CE64 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805CE6C
	ldr r0, _0805CE68 @ =0x02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b _0805CE72
	.align 2, 0
_0805CE60: .4byte 0x0201774C
_0805CE64: .4byte 0x0203E11C
_0805CE68: .4byte 0x02017758
_0805CE6C:
	adds r0, r4, #0
	bl sub_8002DE4
_0805CE72:
	pop {r4}
	pop {r0}
	bx r0

