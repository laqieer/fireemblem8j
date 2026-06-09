	.syntax unified
	.set CallGameOverEvent, 0x0800D654 + 1
	.set SetFlag, 0x080860A8 + 1
	.set StartBgm, 0x08002424 + 1
	.section .text.sub_8085AE8, "ax", %progbits
@ sub_8085AE8 @ JP 0x08085AE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085AE8
	.thumb_func
sub_8085AE8:
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x3e
	movs r1, #0
	bl StartBgm
	ldr r0, _08085B0C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bl CallGameOverEvent
	pop {r0}
	bx r0
	.align 2, 0
_08085B0C: .4byte 0x0202BCEC

