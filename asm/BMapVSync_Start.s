	.syntax unified
	.set WfxInit, 0x08030A84 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8030044, 0x08030044 + 1
	.section .text.BMapVSync_Start, "ax", %progbits
@ BMapVSync_Start @ JP 0x080300A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BMapVSync_Start
	.thumb_func
BMapVSync_Start:
	push {lr}
	ldr r0, _080300BC @ =0x085C5D98
	movs r1, #0
	bl sub_8002BCC
	bl sub_8030044
	bl WfxInit
	ldr r1, _080300C0 @ =0x0202BCAC
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080300BC: .4byte 0x085C5D98
_080300C0: .4byte 0x0202BCAC

