	.syntax unified
	.set GmMu_ResumeMovement, 0x080C2E50 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800CAC4, "ax", %progbits
@ sub_800CAC4 @ JP 0x0800CAC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CAC4
	.thumb_func
sub_800CAC4:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r4, [r1, r2]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CAE6
	ldr r0, _0800CAF0 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl GmMu_ResumeMovement
_0800CAE6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CAF0: .4byte 0x08AC1108

