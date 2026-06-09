	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_808E534, 0x0808E534 + 1
	.set sub_808E8CC, 0x0808E8CC + 1
	.section .text.sub_808F14C, "ax", %progbits
@ sub_808F14C @ JP 0x0808F14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F14C
	.thumb_func
sub_808F14C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0808F17C @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808F180 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _0808F184
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0808F190
	.align 2, 0
_0808F17C: .4byte 0x0202BCAC
_0808F180: .4byte 0x0202E4D4
_0808F184:
	adds r0, r4, #0
	bl sub_808E8CC
	adds r0, r4, #0
	bl sub_808E534
_0808F190:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

