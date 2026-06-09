	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8005BA8, 0x08005BA8 + 1
	.section .text.sub_8005D9C, "ax", %progbits
@ sub_8005D9C @ JP 0x08005D9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005D9C
	.thumb_func
sub_8005D9C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _08005DCC @ =0x085B8F9C
	bl Proc_EndEach
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_8005BA8
	mov r0, r8
	bl GetPortraitData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005DCC: .4byte 0x085B8F9C

