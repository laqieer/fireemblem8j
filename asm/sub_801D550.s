	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_801D550, "ax", %progbits
@ sub_801D550 @ JP 0x0801D550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D550
	.thumb_func
sub_801D550:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0801D588 @ =0x085C3188
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0801D58C @ =0x06005000
	movs r2, #0x80
	bl RegisterDataMove
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0801D580
	adds r0, r5, #0
	bl sub_8002DE4
_0801D580:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D588: .4byte 0x085C3188
_0801D58C: .4byte 0x06005000

