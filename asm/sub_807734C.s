	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807734C, "ax", %progbits
@ sub_807734C @ JP 0x0807734C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807734C
	.thumb_func
sub_807734C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077370 @ =0x02020138
	ldr r0, [r0]
	cmp r0, #1
	bne _0807736A
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl sub_8002DE4
_0807736A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077370: .4byte 0x02020138

